#!/usr/bin/perl

##############################################################
## MoneyPro用トランザクションデータ作成
##
## 【使い方】
## perl make_transaction_record.pl <MoneyPro.csv>
##
## 【事後作業】
## 出力された sql を MoneyPro DB にインポート
##
## $ docker exec -it metabase_postgres /bin/bash
## su - postgres
## psql
## SQL> \i output.sql
##
##############################################################

use Text::ParseWords;

if(@ARGV == 1)
{
  my $dlm = ","; # 区切り文字を定義

  open(IN, "<", $ARGV[0]);
  open(OUT, ">", $ARGV[0].'.sql');
  while(<IN>){
    if ($. != 1) {
      chomp;
      my @d = &parse_line($dlm, undef, $_);
      for(my $i=0; $i<=$#d-1; $i++)
      {
        $d[$i] =~ s/$dlm//g;
        $d[$i] =~ s/¥//g;
        $d[$i] =~ s/\.00//g;
        if($i == 3) # 残高マイナスは括弧のため、括弧を削除してマイナスを入力
        {
          $d[$i] =~ s/\((.+)\)/\-$1/g;
        }
        if($i == 4 || $i == 5) # カテゴリー末尾に半角空白があるため削除
        {
          $d[$i] =~ s/^\s*//; # 先頭空白削除
          $d[$i] =~ s/\s*$//; # 末尾空白削除
        }
        if($d[$i] eq '') # "" なら　NULL とする
        {
          $d[$i] = NULL
        }
        else # "" でないなら "文字列or数値" とする
        {
          $d[$i] = "\'".$d[$i]."\'";
        }
      }
      pop(@d);
      print OUT "INSERT INTO moneypro VALUES (".join($dlm, @d).");\n";
    }
  }
  close(OUT);
  close(IN);
}else{
  print "引数は1つ指定して下さい\n";
}
