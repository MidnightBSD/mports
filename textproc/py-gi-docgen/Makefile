PORTNAME=	gi-docgen
PORTVERSION=	2022.1
CATEGORIES=	textproc python
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
PKGNAMEPREFIX=  ${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Documentation generator for GObject-based libraries

LICENSE=	Apache-2.0 gpl3
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSES/Apache-2.0.txt
LICENSE_FILE_gpl3=	${WRKSRC}/LICENSES/GPL-3.0-or-later.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Jinja2>0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}markdown>0:textproc/py-markdown@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}markupsafe>0:textproc/py-markupsafe@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>0:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}smartypants>0:textproc/py-smartypants@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}toml>0:textproc/py-toml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typogrify>0:textproc/py-typogrify@${PY_FLAVOR}

USES=		python tar:xz
USE_PYTHON= 	autoplist distutils

NO_ARCH=	yes

post-patch:
	${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/gidocgen/utils.py

.include <bsd.port.mk>
