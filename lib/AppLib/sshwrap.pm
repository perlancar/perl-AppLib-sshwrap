package AppLib::sshwrap;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

my $compfile = sub {
    require Complete::File;
    my %args = @_;
    Complete::File::complete_file(word=>$args{word});
};

my $compuser = sub {
    require Complete::Unix;
    my %args = @_;
    Complete::Unix::complete_user(word=>$args{word});
};

my $compport = sub {
    require Complete::Number;
    my %args = @_;
    Complete::Number::complete_int(word=>$args{word}, min=>0, max=>65535);
};

our %optspec = (
    '-1' => undef,
    '-2' => undef,
    '-4' => undef,
    '-6' => undef,
    '-A' => undef,
    '-a' => undef,
    '-C' => undef,
    '-f' => undef,
    '-G' => undef,
    '-g' => undef,
    '-K' => undef,
    '-k' => undef,
    '-M' => undef,
    '-N' => undef,
    '-n' => undef,
    '-q' => undef,
    '-s' => undef,
    '-T' => undef,
    '-t' => undef,
    '-V' => undef,
    '-v' => undef,
    '-X' => undef,
    '-x' => undef,
    '-Y' => undef,
    '-y' => undef,
    '-b=s' => undef, # bind_address
    '-c=s' => undef, # cipher_spec
    '-D=s' => undef, # bind_address:[port]
    '-E=s' => {completion=>$compfile}, # log_file
    '-e=s' => undef, # escape_char
    '-F=s' => {completion=>$compfile}, # configfile
    '-I=s' => undef, #pkcs11
    '-i=s' => {completion=>$compfile}, # identity_file
    '-L=s' => undef, # address
    '-l=s' => {completion=>$compuser}, # login_name
    '-m=s' => undef, # mac_spec
    '-O=s' => undef, # ctl_cmd
    '-o=s' => undef, # option
    '-p=s' => {completion=>$compport}, # port
    '-Q=s' => undef, # query_option
    '-R=s' => undef, # address
    '-S=s' => {completion=>$compfile}, # ctl_path
    '-W=s' => undef, # host:port
    '-w=s' => undef, # local_tun[:remote_tun]
    '{arg}' => undef, # [user@]hostname [command]
);

1;
# ABSTRACT: Common routines/data for sshwrap-* scripts

=head1 SYNOPSIS

=cut
