PORTNAME=	ulxmlrpcpp
PORTVERSION=	1.7.5
PORTREVISION=	2
CATEGORIES=	net devel
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ultra lightweight xml-rpc library written in C++
WWW=		http://ulxmlrpcpp.sourceforge.net/

LICENSE=	lgpl

LIB_DEPENDS=	libexpat.so:textproc/expat2

USES=		compiler:c++14-lang iconv libtool pathfix ssl tar:bzip2
USE_CXXSTD=	c++14
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	PTHREAD_LIBS="-lpthread"
INSTALL_TARGET=	install-strip

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s| docs | |g' ${WRKSRC}/ulxmlrpcpp/Makefile.in

.include <bsd.port.mk>
