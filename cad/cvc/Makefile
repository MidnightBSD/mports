PORTNAME=	cvc
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.5
PORTREVISION=	1
CATEGORIES=	cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Circuit Validity Checker
WWW=		https://github.com/d-m-bailey/cvc

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	pyinstaller:devel/py-pyinstaller@${PY_FLAVOR} \
		bash:shells/bash

USES=		autoreconf bison gettext-runtime gettext-tools gmake python readline shebangfix
USE_GCC=	yes # clang fails, see https://github.com/d-m-bailey/cvc/issues/239
		    # gcc11 is unavailable in mports; use the framework default GCC.

SHEBANG_FILES=	scripts/calibre_cvc scripts/clean_cvc_log scripts/expand_cells.py

GNU_CONFIGURE=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	d-m-bailey

MAKE_ARGS=	INTLLIBS=-lintl

.include <bsd.port.mk>
