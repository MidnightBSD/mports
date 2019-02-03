# $MidnightBSD$

PORTNAME=	sysconftool
PORTVERSION=	0.17
CATEGORIES=	devel
MASTER_SITES=	SF/courier/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helps to install application configuration files

LICENSE=	gpl3

USES=		tar:bzip2
USE_PERL5=	yes
GNu_CONFIGURE=	yes

USE_AUTOTOOLS=	automake aclocal autoconf

pre-patch:
	@${CP} ${TEMPLATES}/config.guess ${TEMPLATES}/config.sub ${WRKSRC}

.include <bsd.port.mk>
