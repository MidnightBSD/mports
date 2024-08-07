PORTNAME=	cvsgraph
DISTVERSION=	1.7.2
PORTREVISION=	4
CATEGORIES=	devel graphics
MASTER_SITES=	https://www.vagrearg.org/cvsgraph/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph the life story of a file under CVS or RCS
WWW=		https://www.vagrearg.org/content/cvsgraph

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgd.so:graphics/gd \
		libpng16.so:graphics/png \
		libtiff.so:graphics/tiff \
		libwebp.so:graphics/webp \
		libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

USES=		localbase:ldflags jpeg pkgconfig

DOCDIR=		share/doc/${PORTNAME}
DOCS=		ChangeLog README
EXAMPLES=	cvsgraphwrapper.php mkimage.php
MORE_EXAMPLES=	README.Automatic_documentation checkoutlist commit_action.sh \
		commitinfo cvswrappers tag_action.sh taginfo
PLIST=		${WRKDIR}/pkg-plist
SUB_FILES=	pkg-message
GNU_CONFIGURE=	yes
LDFLAGS+=	-lm
CONFIGURE_ARGS=	--with-gd-inc=${LOCALBASE}/include \
		--with-gd-lib=${LOCALBASE}/lib
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
REINPLACE_ARGS=	-i ""

pre-patch:
	@${REINPLACE_CMD} -e "s:/home/bertho/tmp/cvstest:/home/ncvs:g" ${WRKSRC}/cvsgraph.conf

pre-install:
	${ECHO_CMD} bin/cvsgraph > ${PLIST}
	${ECHO_CMD} etc/cvsgraph.conf.sample >> ${PLIST}
.if !defined(NOPORTDOCS)
.for i in ${DOCS}
	${ECHO_CMD} ${DOCDIR}/${i} >> ${PLIST}
.endfor
.for i in ${MORE_EXAMPLES}
	${ECHO_CMD} share/examples/${PORTNAME}/automatic_documentation/${i} >> ${PLIST}
.endfor
.for i in ${EXAMPLES}
	${ECHO_CMD} share/examples/${PORTNAME}/${i} >> ${PLIST}
.endfor
	${ECHO_CMD} @dirrm share/examples/${PORTNAME}/automatic_documentation >> ${PLIST}
	${ECHO_CMD} @dirrm share/examples/${PORTNAME} >> ${PLIST}
	${ECHO_CMD} @dirrm ${DOCDIR} >> ${PLIST}
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/cvsgraph.conf ${PREFIX}/etc/cvsgraph.conf.sample
	${INSTALL_MAN} ${WRKSRC}/cvsgraph.1 ${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/cvsgraph.conf.5 ${PREFIX}/man/man5
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/${DOCDIR}
	${MKDIR} ${PREFIX}/share/examples/${PORTNAME}
	${MKDIR} ${PREFIX}/share/examples/${PORTNAME}/automatic_documentation
.for i in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${PREFIX}/${DOCDIR}
.endfor
.for i in ${EXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/contrib/${i} ${PREFIX}/share/examples/${PORTNAME}
.endfor
.for i in ${MORE_EXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/contrib/automatic_documentation/${i} ${PREFIX}/share/examples/${PORTNAME}/automatic_documentation
.endfor
.endif

.include <bsd.port.mk>
