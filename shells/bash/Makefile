# ex:ts=8
# New ports collection makefile for:    bash3
# Date created:				30 Jul 2004
# Whom:					Oliver Eikemeier
#
# $MidnightBSD: mports/shells/bash/Makefile,v 1.7 2008/10/01 19:54:15 laffer1 Exp $
# $FreeBSD: ports/shells/bash/Makefile,v 1.93 2006/09/01 05:45:04 obrien Exp $
#

PORTNAME=		bash
PATCHLEVEL=		39
PORTVERSION=		3.2.${PATCHLEVEL:S/^0//g}
CATEGORIES=		shells
MASTER_SITES=		${MASTER_SITE_GNU:S/$/:bash/} \
			ftp://ftp.cwru.edu/pub/%SUBDIR%/:faq
MASTER_SITE_SUBDIR=	${PORTNAME}/:bash,faq
DISTNAME=		${PORTNAME}-${PORTVERSION:R}
DISTFILES=		${DISTNAME}${EXTRACT_SUFX}:bash
DIST_SUBDIR=		${PORTNAME}
EXTRACT_ONLY=		${DISTNAME}${EXTRACT_SUFX}

PATCH_SITES=		${MASTER_SITE_GNU} \
			ftp://ftp.cwru.edu/pub/%SUBDIR%/
PATCH_SITE_SUBDIR=	${PORTNAME}/${DISTNAME}-patches/
PATCHFILES!=		/usr/bin/jot -s " " -w \
			${PORTNAME}${PORTVERSION:R:S/.//g}-%03d \
			${PATCHLEVEL} 1 ${PATCHLEVEL}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		The GNU Project's Bourne Again SHell
LICENSE=		gpl2

IGNOREFILES=		FAQ

OPTIONS=	IMPLICITCD       "Add support for implicit cd." On \
		COLONBREAKSWORDS "Have word completion break words on ':'." On \
		INCLUDED_FAQ	 "Install the included FAQ." Off \
		STATIC_BASH      "Statically link bash." Off \
		NLS		 "Enable native language support." On \
		HELP		 "Install builtin help." On \
		HELPFILES        "Install descrete helpfiles." On

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_IMPLICITCD)
EXTRA_PATCHES+=		${PATCHDIR}/xpatch-implicitcd
.endif

.if !defined(WITHOUT_COLONBREAKSWORDS)
EXTRA_PATCHES+=		${PATCHDIR}/xpatch-colonbreakswords
.endif

MAN1=			bash.1 bashbug.1
MLINKS=			bash.1 rbash.1
INFO=			bash

GNU_CONFIGURE=		yes

.if !defined(NOPORTDOCS)
.if !defined(WITH_INCLUDED_FAQ)
DISTFILES+=		FAQ:faq
.endif
PORTDOCS=		FAQ INTRO CHANGES COMPAT NEWS POSIX RBASH
.endif

CONFIGURE_ARGS=		--without-bash-malloc \
			--disable-rpath \
			--enable-disabled-builtins

.if defined(WITH_STATIC_BASH) || defined(NO_DYNAMICROOT) || (defined(NOSHARED) && ${NOSHARED:L} != "no")
.if !defined(WITHOUT_NLS)
WITHOUT_NLS=yes
.endif
CONFIGURE_ARGS+=	--enable-static-link
PKGNAMESUFFIX=	-static
.else
CONFIGURE_ARGS+=	--enable-static-link=no
.endif

.if defined(WITHOUT_HELP)
CONFIGURE_ARGS+=	--disable-help-builtin
PLIST_SUB+=		HELP="@comment "
.elif defined(WITHOUT_HELPFILES)
PLIST_SUB+=		HELP="@comment "
.else
CONFIGURE_ARGS+=	--enable-separate-helpfiles
PLIST_SUB+=		HELP=""
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.else
USE_GETTEXT=		yes
PLIST_SUB+=		NLS=""
.endif

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

CPPFLAGS+=		${PTHREAD_CFLAGS} \
			-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib

CONFIGURE_ENV=		CPPFLAGS="${CPPFLAGS}" \
			LDFLAGS="${LDFLAGS}" \
			YACC="${YACC}"

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/doc/bash.1

post-configure:
	@${FIND} ${WRKSRC} -name Makefile -print0 | ${XARGS} -0 \
		${REINPLACE_CMD} -e "s|^DESTDIR *=|& ${DESTDIR}|"

pre-build:
	@${ECHO_CMD} $$((${PORTREVISION}-1)) > ${WRKSRC}/.build

post-install:
	${LN} -s ${PREFIX}/bin/bash ${PREFIX}/bin/rbash
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.if !defined(WITH_INCLUDED_FAQ)
	@${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/FAQ \
		${WRKSRC}/doc/INTRO ${DOCSDIR}
.else
	@${INSTALL_DATA} ${WRKSRC}/doc/FAQ \
		${WRKSRC}/doc/INTRO ${DOCSDIR}
.endif
	@for d in ${PORTDOCS:NFAQ:NINTRO}; do \
		${INSTALL_DATA} ${WRKSRC}/$${d} ${DOCSDIR}; \
	done
.endif

.include <bsd.port.post.mk>
