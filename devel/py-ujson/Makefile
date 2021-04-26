PORTNAME=	ujson
PORTVERSION=	3.0.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ultra fast JSON encoder and decoder for Python

LICENSE=	bsd3 TclTk
LICENSE_COMB=	multi
LICENSE_NAME_TclTk=	Tcl/Tk License
LICENSE_TEXT_TclTk=	http://www.tcl.tk/software/tcltk/license.html
LICENSE_PERMS_TclTk=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>=0:devel/py-setuptools_scm@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
