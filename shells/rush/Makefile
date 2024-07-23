PORTNAME=	rush
DISTVERSION=	2.3
PORTREVISION=	1
CATEGORIES=	shells
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Restricted User SHell, providing limited remote access to resources
WWW=		https://puszcza.gnu.org.ua/software/rush/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GCC=	yes

USES=		cpe gettext-runtime gmake tar:xz

CPE_VENDOR=	gnu

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share

INFO=		${PORTNAME}

.include <bsd.port.mk>
