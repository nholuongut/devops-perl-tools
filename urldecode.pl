#!/usr/bin/perl -T
#
#  Author: Nho Luong
#  Date: 2020-03-04 09:49:50 +0000 (Wed, 04 Mar 2020)
#
#  https://github.com/nholuongut/devops-perl-tools
#
#  License: see accompanying Nho Luong LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn
#  and optionally send me feedback to help improve or steer this or other code I publish
#
#  https://www.linkedin.com/in/nholuong
#

$DESCRIPTION="URL Decode text from standard input or arguments";

$VERSION = "0.1.1";

use strict;
use warnings;
use utf8;
BEGIN {
    use File::Basename;
    use lib dirname(__FILE__) . "/lib";
}
use nholuongutUtils;
use URI::Escape;

remove_timeout;

get_options();

if(@ARGV){
    foreach(@ARGV){
        print uri_unescape($_) . "\n";
    }
} else {
    while(<STDIN>){
        chomp;
        print uri_unescape($_) . "\n";
    }
}
