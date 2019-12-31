PORTNAME=	game
DISTVERSION=	1.9.6
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module designed to write games in Python

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/docs/LGPL

BUILD_DEPENDS=	v4l_compat>0:multimedia/v4l_compat
LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libpng.so:graphics/png \
		libsmpeg.so:multimedia/smpeg
RUN_DEPENDS=	${PYNUMPY} \
		v4l_compat>0:multimedia/v4l_compat

USES=		jpeg python sdl xorg pkgconfig
USE_SDL=	ttf image mixer
USE_PYTHON=	autoplist distutils
USE_XORG=	x11

SDLNOX11=	sdl-nox11-[0-9]*

DOCSDIR=	${PREFIX}/share/doc/py-${PORTNAME}
EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}

OPTIONS_DEFINE=	DOCS EXAMPLES

PORTDOCS=	*
PORTEXAMPLES=	*

NO_TEST=	yes

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}

#Remove Un-needed macosx files
	@${RM} -r ${WRKSRC}/examples/macosx
	${TAR} -C ${WRKSRC}/examples -cf - . | \
		${TAR} --unlink -C ${FAKE_DESTDIR}${EXAMPLESDIR} -xf -

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${TAR} -C ${WRKSRC}/docs -cf - . | \
	${TAR} --unlink -C ${FAKE_DESTDIR}${DOCSDIR} -xf -

.include <bsd.port.mk>
