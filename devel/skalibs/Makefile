PORTNAME=	skalibs
DISTVERSION=    2.13.1.1
CATEGORIES=	devel
MASTER_SITES=	https://www.skarnet.org/software/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose C libraries used by skarnet.org software
WWW=		https://www.skarnet.org/software/skalibs/

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN_mips64=	fails to build: Checking whether system has auto-close after fd-passing... test crashed, aborting

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
.for d in libdatastruct libposixplz librandom libstdcrypto libstddjb libunixonacid
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/${d}
	cd ${WRKSRC} && ${INSTALL_DATA} doc/${d}/*.html ${FAKE_DESTDIR}${DOCSDIR}/${d}
.endfor

.include <bsd.port.mk>
