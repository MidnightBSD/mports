PORTNAME=	sip
PORTVERSION=	${SIP_VERSION}
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITES_SIP}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${SIP_DISTNAME}

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Python to C and C++ bindings generator
WWW=		http://www.riverbankcomputing.co.uk/software/sip/

LICENSE=		SIP gpl2 gpl3
LICENSE_COMB=		multi
LICENSE_NAME_SIP=	SIP License
LICENSE_GROUPS_SIP=	FSF GPL OSI
LICENSE_PERMS_SIP=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_FILE_SIP=	${WRKSRC}/LICENSE 
LICENSE_FILE_gpl2=	${WRKSRC}/LICENSE-GPL2
LICENSE_FILE_gpl3=	${WRKSRC}/LICENSE-GPL3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ply>0:devel/py-ply@${PY_FLAVOR}

USES=		python pyqt:sip
USE_PYTHON=	autoplist concurrent distutils flavors
USE_PYQT=	#

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tomli>=0:textproc/py-tomli@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
