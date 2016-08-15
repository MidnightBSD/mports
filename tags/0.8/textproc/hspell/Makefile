# $MidnightBSD$

PORTNAME=	hspell
PORTVERSION=	1.0
CATEGORIES=	textproc hebrew
MASTER_SITES=	http://www.ivrix.org.il/projects/spell-checker/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	makc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hebrew spellchecker and morphology engine
LICENSE=	gpl2

USE_PERL5_BUILD=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CFLAGS+=	-fPIC

MAN1=		hspell.1
MAN3=		hspell.3

post-install:
	@${SED} -e "s:%%PORTSDIR%%:${PORTSDIR}:g" ${PKGMESSAGE}

.include <bsd.port.mk>
