# Created by: Wen Heping <wenheping@gmail.com>
# $FreeBSD: head/devel/py-darcsver/Makefile 371280 2014-10-20 16:04:12Z mva $
# $MidnightBSD$

PORTNAME=	darcsver
PORTVERSION=	1.7.4
PORTREVISION=	2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate a version number from darcs history

LICENSE=	unknown

USES=		python
USE_PYTHON=	distutils autoplist

post-patch:
	@${REINPLACE_CMD} -e 's#(doc_loc, data_fnames)##g' ${WRKSRC}/setup.py


.include <bsd.port.mk>
