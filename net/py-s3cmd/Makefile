# Created by: Gea-Suan Lin <gslin@gslin.org>

PORTNAME=	s3cmd
DISTVERSION=	2.1.0
CATEGORIES=	net python
MASTER_SITES=	SF/s3tools/${PORTNAME}/${DISTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unix-like tools to manipulate stored files from the command line

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

OPTIONS_SINGLE=	SG1
OPTIONS_SINGLE_SG1=	MAGIC PYTHON_MAGIC

OPTIONS_DEFAULT=	MAGIC

MAGIC_DESC=		Use devel/py-magic
PYTHON_MAGIC_DESC=	Use devel/py-python-magic

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dateutil>0:devel/py-dateutil@${PY_FLAVOR}

MAGIC_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}magic>0:devel/py-magic@${PY_FLAVOR}
PYTHON_MAGIC_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-magic>0:devel/py-python-magic@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

OPTIONS_DEFINE=	DOCS

post-patch:
	${REINPLACE_CMD} -e 's,share/man,man,' ${WRKSRC}/setup.py

post-patch-DOCS-on:
	${REINPLACE_CMD} -e 's,doc/packages,doc,' ${WRKSRC}/setup.py

post-patch-DOCS-off:
	${REINPLACE_CMD} -e '/(doc_path+/d' ${WRKSRC}/setup.py

.include <bsd.port.mk>
