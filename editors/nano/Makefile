# $MidnightBSD: mports/editors/nano/Makefile,v 1.12 2010/12/04 19:16:42 crash Exp $

PORTNAME=	nano
PORTVERSION=	2.2.6
PORTREVISION=	1
CATEGORIES=	editors
MASTER_SITES=	http://www.nano-editor.org/dist/v2.2/ \
		http://www.ewtoo.org/~astyanax/nano/dist/v2.2/ \
		${MASTER_SITE_GNU}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nano's ANOther editor, an enhanced free Pico clone
LICENSE=	gpl3

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--infodir=${PREFIX}/${INFO_PATH} --mandir=${PREFIX}/man \
		--docdir=${DOCSDIR}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd7.0
MAKE_JOBS_SAFE=	yes

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

.include <bsd.port.pre.mk>

.if (${OSVERSION} < 3000)
CONFIGURE_ARGS+=--disable-utf8
.else
CONFIGURE_ARGS+=--enable-utf8
.endif

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

.include <bsd.port.post.mk>
