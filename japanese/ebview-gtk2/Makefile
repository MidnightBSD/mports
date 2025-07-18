PORTNAME=	ebview
PORTVERSION=	0.3.6
PORTREVISION=	20
CATEGORIES=	japanese
MASTER_SITES=	SF
PKGNAMESUFFIX=	-gtk2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Electronic Book Viewer
WWW=		https://ebview.sourceforge.net/

LICENSE=	gpl2+

LIB_DEPENDS=	libeb.so:japanese/eb

USES=		gettext gmake gnome localbase:ldflags pkgconfig
USE_CSTD=	gnu89
USE_GNOME=	gtk20 pangox-compat

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-eb-conf=${LOCALBASE}/etc/eb.conf

CONFLICTS=	ja-ebview

SUB_FILES=	ebview.desktop

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if ${OPSYS} == FreeBSD
CFLAGS+=	-Wno-error=int-conversion
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|#define GTK_DISABLE_DEPRECATED 1||g' \
		${WRKSRC}/src/ebview.c

post-install:
	(cd ${WRKDIR} && ${INSTALL_DATA} ${SUB_FILES} \
		${STAGEDIR}${DESKTOPDIR})
	(cd ${WRKSRC}/pixmaps && ${INSTALL_DATA} ebview.xpm \
		${STAGEDIR}${PREFIX}/share/pixmaps)

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in ChangeLog README
	(cd ${WRKSRC} && ${INSTALL_DATA} ${i} ${FAKE_DESTDIR}${DOCSDIR})
.endfor

.include <bsd.port.post.mk>
