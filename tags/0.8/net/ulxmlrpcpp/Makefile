# Ports collection makefile for:	ulxmlrpcpp
# Date created:			Feb 26, 2008
# Whom:				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$

PORTNAME=	ulxmlrpcpp
PORTVERSION=	1.7.5
CATEGORIES=	net devel
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ultra lightweight xml-rpc library written in C++

LICENSE=	lgpl

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

USES=		tar:bzip2 pathfix iconv libtool
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
USE_LDCONFIG=	yes

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s| docs | |g' ${WRKSRC}/ulxmlrpcpp/Makefile.in

.include <bsd.port.mk>
