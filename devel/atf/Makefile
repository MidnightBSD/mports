PORTNAME=	atf
DISTVERSION=	0.23
CATEGORIES=	devel
MASTER_SITES=	https://github.com/freebsd/${PORTNAME}/releases/download/${PORTNAME}-${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C, C++ and shell libraries to write ATF-compliant test programs
WWW=		https://github.com/freebsd/atf

LICENSE=	bsd3

USES=		autoreconf libtool pathfix
USE_CXXSTD=	gnu++14
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes

INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS TEST
OPTIONS_DEFAULT=TEST
OPTIONS_SUB=	yes

DOCS_MAKE_ARGS_OFF=	doc_DATA=

post-install-TEST-off:
	@${RM} -r ${FAKE_DESTDIR}${PREFIX}/tests

.include <bsd.port.mk>
