# $MidnightBSD: mports/sysutils/dvdbackup/Makefile,v 1.3 2012/03/06 01:42:47 laffer1 Exp $

PORTNAME=	dvdbackup
PORTVERSION=	0.4.2
CATEGORIES=	sysutils multimedia
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backup content from DVD to hard disk
LICENSE=	gpl3

LIB_DEPENDS=	dvdread:${PORTSDIR}/multimedia/libdvdread

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		dvdbackup.1
PORTDOCS=	NEWS README

DEFAULT_DVD_DEVICE?=	/dev/cd0

OPTIONS_DEFINE=	DOCS NLS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
CONFIGURE_ARGS+=	--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} "s|/dev/dvd|${DEFAULT_DVD_DEVICE}|g" \
		${WRKSRC}/src/main.c ${WRKSRC}/po/*.po ${WRKSRC}/po/*.pot \
		${WRKSRC}/README ${WRKSRC}/man/dvdbackup.1

pre-configure:
.if empty(PORT_OPTIONS:MDOCS)
	@${REINPLACE_CMD} 's|^install-data-am: .*|install-data-am: |' \
		${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
