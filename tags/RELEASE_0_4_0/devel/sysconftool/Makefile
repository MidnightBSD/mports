# $MidnightBSD: mports/devel/sysconftool/Makefile,v 1.6 2011/02/02 20:17:34 laffer1 Exp $

PORTNAME=	sysconftool
PORTVERSION=	0.16
CATEGORIES=	devel
MASTER_SITES=	SF/courier/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helps to install application configuration files
LICENSE=	gpl2

USE_BZIP2=	yes
USE_PERL5=	yes
HAS_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

USE_AUTOTOOLS=	automake aclocal autoconf

MAN1=	sysconftool.1 sysconftoolcheck.1
MAN7=	sysconftool.7

pre-patch:
	@${CP} ${TEMPLATES}/config.guess ${TEMPLATES}/config.sub ${WRKSRC}

.include <bsd.port.mk>
