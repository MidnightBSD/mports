# Created by: Sergei Kolobov <sergei@kolobov.com>

PORTNAME=	skalibs
PORTVERSION=	2.10.0.3
CATEGORIES=	devel
MASTER_SITES=	https://www.skarnet.org/software/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose C libraries used by skarnet.org software

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake
USE_LDCONFIG=	yes
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--with-default-path=${PREFIX}/bin:/usr/bin:/bin

OPTIONS_DEFINE=	DOCS

DOCS=		AUTHORS README doc/*.html

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libskarnet.so.${PORTVERSION}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR}
.for d in libbiguint libdatastruct librandom libstdcrypto libstddjb libunixonacid
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/${d}
	cd ${WRKSRC} && ${INSTALL_DATA} doc/${d}/*.html ${FAKE_DESTDIR}${DOCSDIR}/${d}
.endfor

.include <bsd.port.mk>
