PORTNAME=	xapian
PORTVERSION=	1.4.29
DISTVERSIONPREFIX=	bindings-
CATEGORIES=	databases python
MASTER_SITES=	https://oligarchy.co.uk/xapian/${PORTVERSION}/ \
		FREEBSD_LOCAL/sunpoet
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python binding for Xapian
WWW=		https://xapian.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	xapian-core>=${PORTVERSION}:databases/xapian-core
LIB_DEPENDS=	libxapian.so:databases/xapian-core

USES=		compiler:c++11-lang libtool python tar:xz
USE_PYTHON=	flavors

CONFIGURE_ARGS=	--datarootdir=${DATADIR} \
		--docdir=${DOCSDIR} \
		--enable-shared \
		--enable-static \
		--with-python3 \
		--without-csharp \
		--without-java \
		--without-lua \
		--without-perl \
		--without-php \
		--without-python \
		--without-ruby \
		--without-tcl
CONFIGURE_ENV=	PYTHON3=${PYTHON_CMD}
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_CXXSTD=	c++11

PORTDOCS=	*

CONFLICTS_INSTALL=	xapian-bindings12

PORTSCOUT=	limitw:1,even

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR}
DOCS_EXTRA_PATCHES_OFF=	${PATCHDIR}/extra-patch-python3-Makefile.in

.include <bsd.port.mk>
