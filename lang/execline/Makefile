# Created by: Sergei Kolobov <sergei@kolobov.com>

PORTNAME=	execline
PORTVERSION=	2.8.0.1
CATEGORIES=	lang shells
MASTER_SITES=	https://www.skarnet.org/software/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight non-interactive sh(1)-like scripting language

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	skalibs>=2.10.0.0:devel/skalibs
LIB_DEPENDS=	libskarnet.so:devel/skalibs

USES=		gmake
USE_LDCONFIG=	yes
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--with-sysdeps=${LOCALBASE}/lib/skalibs/sysdeps \
		--with-lib=${LOCALBASE}/lib/skalibs \
		--with-dynlib=${LOCALBASE}/lib \
		--with-include=${LOCALBASE}/include \
		--enable-shared

OPTIONS_DEFINE=	DOCS

DOCS=		AUTHORS README doc/*.html

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/*
	@${STRIP_CMD} ${PREFIX}/lib/libexecline.so.${PORTVERSION}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
