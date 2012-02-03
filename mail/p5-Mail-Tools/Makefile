# $MidnightBSD: mports/mail/p5-Mail-Tools/Makefile,v 1.3 2009/09/24 02:57:27 laffer1 Exp $

PORTNAME=	Mail-Tools
PORTVERSION=	2.08
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	MailTools-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 modules for dealing with Internet e-mail messages
LICENSE=	perl

RUN_DEPENDS=	p5-TimeDate>=0:${PORTSDIR}/devel/p5-TimeDate
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Mail::Address.3 \
		Mail::Cap.3 \
		Mail::Field.3 \
		Mail::Field::AddrList.3 \
		Mail::Field::Date.3 \
		Mail::Field::Generic.3 \
		Mail::Filter.3 \
		Mail::Header.3 \
		Mail::Internet.3 \
		Mail::Mailer.3 \
		Mail::Send.3 \
		Mail::Util.3

.include <bsd.port.mk>
