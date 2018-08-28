# Created by: jabley@automagic.org
# $MidnightBSD$

PORTNAME=	xml2rfc
PORTVERSION=	2.4.5
CATEGORIES=	textproc
MASTER_SITES=	http://tools.ietf.org/tools/xml2rfc2/cli/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to create RFCs and related documents from XML, as per RFC2629

LICENSE=	bsd3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=2.2.8:${PORTSDIR}/devel/py-lxml

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
