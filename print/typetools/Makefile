PORTNAME=	typetools
PORTVERSION=	2.110
CATEGORIES=	print
MASTER_SITES=	http://www.lcdf.org/type/
DISTNAME=	lcdf-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for manipulating fonts
WWW=		https://www.lcdf.org/type/ #typetools

LICENSE=	gpl2

USES=		tex
USE_TEX=	kpathsea

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--with-kpathsea=${LOCALBASE}

DATADIR=	${PREFIX}/share/lcdf-${PORTNAME}

CONFLICTS_INSTALL=	texlive-base

.include <bsd.port.mk>
