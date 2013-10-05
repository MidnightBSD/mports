# $MidnightBSD$

PORTNAME=	isodate
PORTVERSION=	0.4.9
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ISO 8601 date/time/duration parser and formater

LICENSE=	bsd3

USE_PYTHON=	yes
USE_PYDISTUTILS=yes

NO_STAGE=	yes
post-patch:
	@${REINPLACE_CMD} -e 's|setuptools|do_not_use_&|' ${WRKSRC}/${PYSETUP}

.include <bsd.port.mk>
