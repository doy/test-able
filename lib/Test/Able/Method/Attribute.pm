package Test::Able::Method::Attribute;

use Moose::Role;
use Sub::Identify;

my $attributes;

sub __sub_attributes {
    for my $k ( keys %{ $attributes } ) {
        last unless ref $attributes->{ $k }->[ 0 ]->[ 0 ];
        for ( @{ $attributes->{ $k } } ) {
            $_->[ 0 ] = Sub::Identify::sub_name( $_->[ 0 ] );
        }
    }
    return $attributes;
}

sub MODIFY_CODE_ATTRIBUTES {
    push( @{ $attributes->{ $_[ 0 ] } }, [ @_[ 1, $#_ ] ] );
    return;
}

1;