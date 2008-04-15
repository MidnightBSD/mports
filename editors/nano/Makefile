# New ports collection makefile for:	nano
# Date created:				12 June 2000
# Whom:				Philippe Lefebvre <nemesis@balistik.net>
#
# $MidnightBSD: mports/editors/nano/Makefile,v 1.2 2007/08/23 21:58:16 laffer1 Exp $
# $FreeBSD: ports/editors/nano/Makefile,v 1.37 2007/01/31 20:48:39 naddy Exp $
#

PORTNAME=	nano
PORTVERSION=	2.0.7
CATEGORIES=	editors
MASTER_SITES=	http://www.nano-editor.org/dist/v2.0/ \
		http://www.ewtoo.org/~astyanax/nano/dist/v2.0/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nano's ANOther editor, an enhanced free Pico clone
LICENSE=	gpl2
# Check for GPLv3 when upgrading.  They changed it in cvs.

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--infodir=${PREFIX}/${INFO_PATH} --mandir=${PREFIX}/man \
		--enable-all
CONFIGURE_ARGS+=--disable-utf8	# requires wide character curses
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

INFO=		nano
MAN1=		nano.1 rnano.1
MAN5=		nanorc.5
MANLANG=	"" fr

post-build:
	cd ${WRKSRC}/doc/man; ${REINPLACE_CMD} \
		-e 's:SYSCONFDIR:${PREFIX}/etc:g' \
		-e 's:EXAMPLESDIR:${EXAMPLESDIR}:g' \
		${MAN1} ${MAN5} ${WRKSRC}/doc/texinfo/${INFO:=.info}
	${REINPLACE_CMD} -e 's/\\</[[:<:]]/g' -e 's/\\>/[[:>:]]/g' \
		${WRKSRC}/doc/syntax/*.nanorc

post-install:
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/nanorc.sample ${EXAMPLESDIR}

.include <bsd.port.mk>
