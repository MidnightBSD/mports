# Created by: Yukihiro Nakai <nakai@FreeBSD.org>
# $FreeBSD: head/lang/mono/Makefile 420322 2016-08-17 08:23:37Z romain $
# $MidnightBSD$

PORTNAME=	mono
PORTVERSION=	4.4.2.11
CATEGORIES=	lang
MASTER_SITES=	http://download.mono-project.com/sources/${PORTNAME}/

PATCHFILES=
PATCH_SITES=	https://github.com/mono/mono/commit/
PATCH_DIST_STRIP=-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open source implementation of .NET Development Framework

LICENSE=	lgpl mit
LICENSE_COMB=	dual


BUILD_DEPENDS=	p5-XML-Parser>=0:${PORTSDIR}/textproc/p5-XML-Parser \
		bash:${PORTSDIR}/shells/bash

USES=		bison compiler:c11 cpe gettext gmake iconv libtool pathfix perl5 tar:bzip2
USE_GNOME=	glib20
USE_PERL5=	build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/mono-${PORTVERSION:R}

CONFIGURE_ARGS=	--disable-dtrace

CONFIGURE_ENV=	ac_cv_header_sys_inotify_h=no

# Set location for .wapi creation.
MONO_SHARED_DIR=${WRKDIR}

# LC_ALL is set in order to work around issues people are having when using
# other languages.  This has shown itself in build fails and possibly other
# strange crashes.
MAKE_ENV=	MONO_SHARED_DIR="${MONO_SHARED_DIR}" \
		INSTALL_STRIP_FLAG="${STRIP}" \
		LC_ALL=C TZ=UTC

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|^#!/bin/bash|#!/usr/bin/env bash|g' \
		${WRKSRC}/scripts/mono-find-provides.in \
		${WRKSRC}/scripts/mono-find-requires.in \
		${WRKSRC}/scripts/mono-test-install
	@${FIND} ${WRKSRC} -name '*.sh' | ${XARGS} ${REINPLACE_CMD} \
		-e 's|^#!/bin/bash|#!/bin/sh|g'
	@${REINPLACE_CMD} 's/isinf (1)/isinf (1.0)/g' ${WRKSRC}/configure

tests: build
	@${ECHO_MSG} "===> Running mono regression tests"
	@(cd ${WRKSRC}/mono/tests && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} \
		${MAKE_FLAGS} Makefile ${MAKE_ARGS} check)

post-configure:
	@${REINPLACE_CMD} -e 's|share\/man|man|g' \
		${WRKSRC}/mcs/jay/Makefile

	@${REINPLACE_CMD} 's/^#define HAVE_LOCALCHARSET_H 1/#undef HAVE_LOCALCHARSET_H/' \
		${WRKSRC}/eglib/config.h

.include <bsd.port.post.mk>
