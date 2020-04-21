use YAML; 
use Data::Dump qw/pp/;

use strict;
use warnings;

my $yamlstr = <<'EOS';
---
- 682224
- \"w: 1
EOS
my $pv = eval { YAML::Load($yamlstr) };
if( $@ ){ die "failed(1): ". $@ }

$pv = {<<'EOS' => 1
"w
EOS
};
#print pp($pv);
$pv->{'w\\"'} = 123;

$yamlstr = eval { YAML::Dump($pv) };
if( $@ ){ die "failed(1): ". $@ }
print "result:\n$yamlstr\n";

$pv = {<<'EOS' => 1
"\"w>3'QCU^9_d$vz)/8GKJi"
EOS
};
print pp($pv);
$yamlstr = eval { YAML::Dump($pv) };  
if( $@ ){ die "failed(2): ". $@ }
print "result:\n$yamlstr\n";

