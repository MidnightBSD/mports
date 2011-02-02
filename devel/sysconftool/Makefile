# $MidnightBSD: mports/devel/sysconftool/Makefile,v 1.5 2009/04/08 05:08:25 laffer1 Exp $

PORTNAME=	sysconftool
PORTVERSION=	0.15
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	courier

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helps to install application configuration files
LICENSE=	gpl2

USE_BZIP2=	yes
USE_PERL5=	yes
HAS_CONFIGURE=	yes

USE_AUTOTOOLS=	automake aclocal autoconf

MAN1=	sysconftool.1 sysconftoolcheck.1
MAN7=	sysconftool.7

pre-patch:
	@${CP} ${TEMPLATES}/config.guess ${TEMPLATES}/config.sub ${WRKSRC}

.include <bsd.port.mk>
