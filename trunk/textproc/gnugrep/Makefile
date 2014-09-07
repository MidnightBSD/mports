# $MidnightBSD$

PORTNAME=	grep
PORTVERSION=	2.20
CATEGORIES=	textproc
MASTER_SITES=	GNU
PKGNAMEPREFIX=	gnu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU grep

LICENSE=	gpl3

CONFLICTS=	bsd-grep-*

USES=		tar:xz

GNU_CONFIGURE=	yes

INFO=		grep

OPTIONS=	PCRE	"Compile with Perl-compatible regex support"	off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ENV+=	LDFLAGS="${LDFLAGS}"
LDFLAGS+=	-lintl -L${LOCALBASE}/lib
PLIST_SUB+=	NLS=
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if defined(WITH_PCRE)
LIB_DEPENDS+=	pcre.0:${PORTSDIR}/devel/pcre
.else
CONFIGURE_ARGS+=	--disable-perl-regexp
.endif

post-patch:
.if defined(WITHOUT_NLS)
	@${REINPLACE_CMD} '/install-exec-local:/s/install-exec-localcharset//' \
		${WRKSRC}/lib/Makefile.in
.endif
	@${REINPLACE_CMD} 's|mkinstalldirs = .*|mkinstalldirs = mkdir -p|g' \
		${WRKSRC}/po/Makefile.in.in

.include <bsd.port.post.mk>
