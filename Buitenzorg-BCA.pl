#!usr/bin/buitenzorg-bank/perl
#Tools ini adalah sebuah toold perbank'an online BCA, Kami tidak bertanggung jawab karena tidak ada jaminan surat dari pembuat modulenya
#Please no recode my tools....
#Author : Prakasa_Jr64 && TUANB4DUT
use Term::ANSIColor;
use if $^O eq "MSWin32", Win32::Console::ANSI;
use POSIX qw(strftime);
use Finance::Bank::ID::BCA;
use Log::ger::Output 'Screen';
@months = qw( Januari Februari Maret April Mei Juni Juli Agustus September Oktober November Desmber );
@days = qw(Minggu Senin Selasa Rabu Kamis Jumat Sabtu Minggu);
$years = strftime "%Y", gmtime;
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
mrtamfanx();
menukas();
sub mrtamfanx {
if ($^O =~ /MSWin32/) {system("mode con: cols=100 lines=29");system("cls"); }else { system("resize -s 28 87");system("clear"); }
print color('bold red'),"┏━━━┓  ┳    ┳ ┳ ┏━━┳━━┓ ┏━━━━┓ ┏━┓ ┳ ┏━━━━┓ ┏━━━━┓ ┏━━━━┓ ┏━━━━┓\n";
print color('bold red'),"┃┏━┓┗┓ ┃    ┃ ┃ ┃  ┃  ┃ ┃    ┃ ┃ ┃ ┃ ┻   ┏┛ ┃    ┃ ┃    ┃ ┃\n";
print color('bold red'),"┃┗━┛ ┃ ┃    ┃ ┃    ┃    ┃      ┃ ┃ ┃    ┏┛  ┃    ┃ ┃    ┃ ┃\n";
print color('bold red'),"┃  ━━┫ ┃    ┃ ┃    ┃    ┣━━━   ┃ ┃ ┃   ┏┛   ┃    ┃ ┣━━┳━┛ ┃ ━━━┓\n";
print color('bold white'),"┃┏━┓ ┃ ┃    ┃ ┃    ┃    ┃      ┃ ┃ ┃  ┏┛    ┃    ┃ ┃  ┗┓  ┃    ┃\n";
print color('bold white'),"┃┗━┛┏┛ ┃    ┃ ┃    ┃    ┃    ┃ ┃ ┃ ┃ ┏┛   ┳ ┃    ┃ ┃   ┃  ┃    ┃\n";
print color('bold white'),"┗━━━┛  ┗━━━━┛ ┻    ┻    ┗━━━━┛ ┻ ┗━┛ ┗━━━━┛ ┗━━━━┛ ┻   ┻  ┗━━━━┛\n";
print color('bold cyan'),"┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n";
print color('bold cyan'),"┃";
print color('bold red'),"Author ";
print color('bold green'),": ";
print color('bold white'),"MrTamfanX ";
print color('bold red'),"&& ";
print color('bold white'),"TUANB4DUT ";
print color('bold blue'),"Team ";
print color('bold green'),": ";
print color('bold red'),"Buitenzorg Syndicate.io";
print color('bold cyan'),"┃\n";
print color('bold cyan'),"┃";
print color('bold white'),"Hubungi Contact WhatsApp ";
print color('bold green'),": 62 857";
print color('bold white'),"-";
print color('bold green'),"8041";
print color('bold white'),"-";
print color('bold green'),"1404 ";
print color('bold red'),"& ";
print color('bold green'),"62 812";
print color('bold white'),"-";
print color('bold green'),"2121";
print color('bold white'),"-";
print color('bold green'),"5191";
print color('bold cyan'),"┃\n";
print color('bold cyan'),"┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n";
print color('bold red'),"┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫\n";
print color('bold white'),"[";
print color('bold red'),"•";
print color('bold white'),"]";
print color('bold white'),"Tanggal ";
print color('bold green'),": ";
print color('bold yellow'),"$mday ";
print color('bold white'),"Hari ";
print color('bold green'),": ";
print color('bold yellow'),"$days[$wday] ";
print color('bold white'),"Bulan ";
print color('bold green'),": ";
print color('bold yellow'),"$months[$mon] ";
print color('bold white'),"Tahun ";
print color('bold green'),": ";
print color('bold yellow'),"$years\n";
print color('bold white'),"[";
print color('bold red'),"•";
print color('bold white'),"]";
print color('bold white'),"Jam ";
print color('bold green'),": ";
print color('bold yellow'),"$hour ";
print color('bold green'),": ";
print color('bold yellow'),"$min ";
print color('bold green'),": ";
print color('bold yellow'),"$sec\n\n";
}
sub menukas {
print nomerkas(),"";
chomp($akasuser=<STDIN>);
print nomerkas1(),"";
chomp($akaspass=<STDIN>);
my $indobank = Finance::Bank::ID::BCA->new(
    username => '$akasuser',
    password => '$akaspass',
    verify_https => 1,
);

eval {
    $indobank->login();
 
    my @accts = $indobank->list_accounts();
 
    my $bal = $indobank->check_balance($acct);

    my $res = $indobank->parse_statement($html);
 
    $stmt = {
   start_date     => $start_dt, # a DateTime object
   end_date       => $end_dt,   # a DateTime object
   account_holder => STRING,
   account        => STRING,    # account number
   currency       => STRING,    # 3-digit currency code
   transactions   => [
       # first transaction
       {
         date        => $dt,
         seq         => INT,
                           
         amount      => REAL,
                              
         description => STRING,
         is_pending  => BOOL,
         branch      => STRING 
         balance     => REAL,
       },
       
   ]
}
    my $stmt = $indobank->get_statement(
        account    => $akasuser,
        days       => 31,
        start_date => DateTime->new(year=>2020, month=>06, day=>21),
                       
        end_date   => DateTime->today,
    );

    print " User : $akasuser \n";
    print " YourTransactions : ";
    for my $tx (@{ $stmt->{transactions} }) {
        print "$tx->{date} $tx->{amount} $tx->{description}\n";
    }
};
warn if $@;
 

$indobank->logout();
}
sub nomerkas
{
    my $n = shift // 'USER';
    return color('bold white'),"["
    , color('bold green'),"$n"
    , color('bold white'),"] TYPE YOUR USERNAME BANK BCA "
    , color('bold green'),": "
    , color('bold yellow')
    ;
}
sub nomerkas1
{
    my $n = shift // 'PASS';
    return color('bold white'),"["
    , color('bold green'),"$n"
    , color('bold white'),"] TYPE YOUR PASSWORD BANK BCA "
    , color('bold green'),": "
    , color('bold yellow')
    ;
}
