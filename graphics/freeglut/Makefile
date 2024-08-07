PORTNAME=	freeglut
PORTVERSION=	3.2.1
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open source implementation of the GLUT library
WWW=		https://freeglut.sourceforge.net/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake:insource gl localbase:ldflags pathfix xorg
USE_LDCONFIG=	yes
USE_XORG=	ice x11 xi xrandr xxf86vm
USE_GL=		gl glu
LDFLAGS+=	-lusbhid -lm
INSTALL_TARGET=	install/strip

DOCS=	download.html freeglut.html freeglut_logo.png		\
	freeglut_user_interface.html index.html ogl_sm.png	\
	progress.html structure.html
BINS=	CallbackMaker Fractals Fractals_random Lorenz One Resizer \
	multi-touch shapes smooth_opengl3 spaceball subwin timer

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.mport.options.mk>

pre-configure:
.for fract in Fractals/fractals.c Fractals_random/fractals_random.c
	@${REINPLACE_CMD} -e "s|/usr/local|${PREFIX}|g"		\
		${WRKSRC}/progs/demos/${fract}
.endfor

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for FILE in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/doc/${FILE} ${DOCSDIR}
.endfor
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/progs/demos/Fractals/fractals.dat ${EXAMPLESDIR}
.for prog in ${BINS}
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${prog} ${STAGEDIR}${EXAMPLESDIR}
.endfor
	@${ECHO_MSG} "===> Examples installed in ${EXAMPLESDIR}."
.endif

.include <bsd.port.mk>
