# $Id: OrigTree.pm,v 1.3 2008-06-29 22:52:58 laffer1 Exp $

package XML::Parser::Style::OrigTree;
$XML::Parser::Built_In_Styles{OrigTree} = 1;

sub Init {
  my $expat = shift;
  $expat->{Lists} = [];
  $expat->{Curlist} = $expat->{OrigTree} = [];
}

sub Start {
  my $expat = shift;
  my $tag = shift;
  my $newlist = [ { @_ } ];
  push @{ $expat->{Lists} }, $expat->{Curlist};
  push @{ $expat->{Curlist} }, $tag => $newlist;
  $expat->{Curlist} = $newlist;
}

sub End {
  my $expat = shift;
  my $tag = shift;
  $expat->{Curlist} = pop @{ $expat->{Lists} };
}

sub Char {
  my $expat = shift;
  my $text = shift;
  my $clist = $expat->{Curlist};
  my $pos = $#$clist;
  
  if ($pos > 0 and $clist->[$pos - 1] eq '0') {
    $clist->[$pos] .= $expat->original_string();
  } else {
    push @$clist, 0 => $expat->original_string();
  }
}

sub Final {
  my $expat = shift;
  delete $expat->{Curlist};
  delete $expat->{Lists};
  $expat->{OrigTree};
}

1;
__END__

=head1 NAME

XML::Parser::Style::OrigTree

=head1 SYNOPSIS

  use XML::Parser;
  my $p = XML::Parser->new(Style => 'OrigTree');
  my $tree = $p->parsefile('foo.xml');

=head1 DESCRIPTION

This module is a variant of the XML::Parser's Tree style parser.  It
uses original_string, so that Entities are not converted.

When parsing a document, C<parse()> will return a parse tree for the
document. Each node in the tree
takes the form of a tag, content pair. Text nodes are represented with
a pseudo-tag of "0" and the string that is their content. For elements,
the content is an array reference. The first item in the array is a
(possibly empty) hash reference containing attributes. The remainder of
the array is a sequence of tag-content pairs representing the content
of the element.

So for example the result of parsing:

  <foo><head id="a">Hello <em>there</em></head><bar>Howdy<ref/></bar>do</foo>

would be:
             Tag   Content
  ==================================================================
  [foo, [{}, head, [{id => "a"}, 0, "Hello ",  em, [{}, 0, "there"]],
              bar, [         {}, 0, "Howdy",  ref, [{}]],
                0, "do"
        ]
  ]

The root document "foo", has 3 children: a "head" element, a "bar"
element and the text "do". After the empty attribute hash, these are
represented in it's contents by 3 tag-content pairs.

=cut
