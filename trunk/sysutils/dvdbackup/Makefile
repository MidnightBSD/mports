# $MidnightBSD: mports/sysutils/dvdbackup/Makefile,v 1.2 2009/12/28 23:03:05 laffer1 Exp $

PORTNAME=	dvdbackup
PORTVERSION=	0.4.1
CATEGORIES=	sysutils multimedia
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backup content from DVD to hard disk
LICENSE=	gpl3

LIB_DEPENDS=	dvdread.4:${PORTSDIR}/multimedia/libdvdread

GNU_CONFIGURE=	yes
USE_GMAKE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		dvdbackup.1
PORTDOCS=	NEWS README

DEFAULT_DVD_DEVICE?=	/dev/acd0

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
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
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} 's|^install-data-am: .*|install-data-am: |' \
		${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
