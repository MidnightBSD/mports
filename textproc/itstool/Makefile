# $MidnightBSD$

PORTNAME=	itstool
PORTVERSION=	1.2.0
CATEGORIES=	textproc
MASTER_SITES=	http://files.itstool.org/itstool/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Make XML documents translatable through po files

LICENSE=	gpl3

RUN_DEPENDS=	${PYTHON_SITELIBDIR}/libxml2.py:${PORTSDIR}/textproc/py-libxml2

USE_BZIP2=	yes
USE_PYTHON_RUN=	yes
GNU_CONFIGURE=	yes

MAN1=		itstool.1

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin/python|${PYTHON_CMD}|g' \
		${WRKSRC}/itstool.in

.include <bsd.port.mk>
