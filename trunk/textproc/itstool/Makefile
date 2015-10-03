# $MidnightBSD$

PORTNAME=	itstool
PORTVERSION=	2.0.2
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	http://files.itstool.org/itstool/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Make XML documents translatable through po files

LICENSE=	gpl3

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/libxml2.py:${PORTSDIR}/textproc/py-libxml2
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/libxml2.py:${PORTSDIR}/textproc/py-libxml2

USES=		python:2,run tar:bzip2
GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|@PYTHON@|${PYTHON_CMD}|g' \
		${WRKSRC}/itstool.in

.include <bsd.port.mk>
