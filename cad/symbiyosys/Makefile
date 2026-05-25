PORTNAME=	symbiyosys
DISTVERSIONPREFIX=	v
DISTVERSION=	0.63
CATEGORIES=	cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SymbiYosys (sby): Front-end for Yosys-based formal verification flows
WWW=		https://yosyshq.readthedocs.io/projects/sby/en/latest/ \
		https://github.com/YosysHQ/sby/

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	yosys:cad/yosys

USES=		gmake python shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	YosysHQ
GH_PROJECT=	sby

SHEBANG_FILES=	sbysrc/sby.py

NO_ARCH=	yes
NO_BUILD=	yes

.include <bsd.port.mk>
