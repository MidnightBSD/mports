# Created by: Thomas Gellekum <tg@FreeBSD.org>

PORTNAME=	rtf
PORTVERSION=	0.45
CATEGORIES=	print python
MASTER_SITES=	SF/py${PORTNAME}/py${PORTNAME}/${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyRTF-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to create RTF documents using the Python language

LICENSE=	gpl

USES=		python
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/* ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
