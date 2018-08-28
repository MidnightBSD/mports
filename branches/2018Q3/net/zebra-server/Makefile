# $MidnightBSD$

PORTNAME=	zebra-server
PORTVERSION=	2.0.55
CATEGORIES=	net
MASTER_SITES=	http://ftp.indexdata.dk/pub/zebra/
DISTNAME=	idzebra-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Z39.50/SR server software

LICENSE=	gpl2

LIB_DEPENDS=	expat:${PORTSDIR}/textproc/expat2 \
		yaz:${PORTSDIR}/net/yaz

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-yaz=${LOCALBASE}/bin \
		--with-tclconfig=${TCL_LIBDIR} \
		--with-iconv=${LOCALBASE} --with-expat=${LOCALBASE}

USES=		iconv libtool
USE_LDCONFIG=	yes
USE_TCL=	yes

.include <bsd.port.mk>
