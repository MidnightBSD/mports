# Created by: D'Arcy Cain <darcy@druid.net>

PORTNAME=	weasyprint
PORTVERSION=	51
PORTREVISION=	1
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	WeasyPrint-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts HTML/CSS documents to PDF

LICENSE=	bsd3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-runner>=0.1:devel/py-pytest-runner@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cairo>=1.15.4:graphics/py-cairo@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cairocffi>=0.9.0:graphics/py-cairocffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cairosvg>=2.4.0:graphics/py-cairosvg@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cffi>=0.6:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cssselect2>=0.1:textproc/py-cssselect2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}html5lib>=0.999999999:www/py-html5lib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyphen>=0.9.1:textproc/py-pyphen@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tinycss2>=1.0.0:textproc/py-tinycss2@${PY_FLAVOR}

USES=		gnome python
USE_PYTHON=	distutils autoplist
USE_GNOME=	gdkpixbuf pango

NO_ARCH=	yes

.include <bsd.port.mk>
