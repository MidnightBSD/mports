PORTNAME=	sip
PORTVERSION=	${PYQT5SIP_VERSION}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITES_PYQT5SIP}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}qt5-
DISTNAME=	${PYQT5SIP_DISTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python to C and C++ bindings generator
WWW=		http://www.riverbankcomputing.co.uk/software/sip/

LICENSE=		SIP gpl2 gpl3
LICENSE_COMB=		multi
LICENSE_GROUPS_SIP=	FSF GPL OSI
LICENSE_NAME_SIP=	SIP License
LICENSE_FILE_SIP=	${FILESDIR}/LICENSE
LICENSE_PERMS_SIP=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		python pyqt:sip
USE_PYTHON=	autoplist concurrent distutils flavors
USE_PYQT=	#

.include <bsd.port.mk>
