PORTNAME=	glog
PORTVERSION=	0.4.0
PORTREVISION=	1
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of C++ classes for flexible logging

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgflags.so:devel/gflags

OPTIONS_DEFINE=	DOCS

USES=		autoreconf compiler:c++11-lang libtool localbase pathfix

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
LDFLAGS+=	-lexecinfo
TEST_TARGET=	check
USE_CXXSTD=	c++11
USE_LDCONFIG=	yes

NO_TEST=	yes

GH_ACCOUNT=	google
USE_GITHUB=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^docdir = / s| = .*| = ${DOCSDIR}|' ${WRKSRC}/Makefile.am

.include <bsd.port.mk>
