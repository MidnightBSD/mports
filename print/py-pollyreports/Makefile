# Created by: Jose Jachuf <jjachuf@gmail.com>

PORTNAME=	PollyReports
PORTVERSION=	1.8
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Band-oriented PDF report generation from database query

LICENSE=	bsd2

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist distutils

OPTIONS_DEFINE=	REPORTLAB

REPORTLAB_DESC=	Install Reportlab
REPORTLAB_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}reportlab>=3.0:print/py-reportlab@${PY_FLAVOR}

.include <bsd.port.mk>
