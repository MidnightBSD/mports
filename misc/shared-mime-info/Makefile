PORTNAME=	shared-mime-info
PORTVERSION=	1.10
CATEGORIES=	misc gnome
MASTER_SITES=	https://people.freedesktop.org/~hadess/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MIME types database from the freedesktop.org project

LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-update-mimedb
USES=		pathfix pkgconfig gettext gmake gnome localbase tar:xz
USE_GNOME=	glib20 libxml2 intltool intlhack
MAKE_JOBS_UNSAFE=	yes

SUB_FILES=	pkg-install
SUB_LIST=	MIMEDIRS="${MIMEDIRS:O:u}"

MIMEDIRS=	${LOCALBASE}/share/mime \
		${PREFIX}/share/mime
MIMESUBDIRS=	application audio image inode message model multipart \
		packages text video x-epoc x-content

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		${WRKSRC}/update-mime-database.c

pre-install:
.for subdir in ${MIMESUBDIRS}
	${MKDIR} ${PREFIX}/share/mime/${subdir}
.endfor

post-fake:
	@${SED} -e 's|%%PREFIX%%|${PREFIX}| ; \
		s|%%MIMEDIRS%%|${MIMEDIRS}|' \
		< ${FILESDIR}/pkg-install.in > ${PKGINSTALL}

.include <bsd.port.mk>
