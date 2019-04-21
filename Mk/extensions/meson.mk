# $MidnightBSD$
# $FreeBSD: head/Mk/Uses/meson.mk 443540 2017-06-13 21:04:27Z kwm $
#
# Provide support for Meson based projects
#
# Feature:		meson
# Usage:		USES=meson
#
# The following files are bundled in source tar files.
# meson.build		- Instructions for meson like autoconf configure,
#			there is no changeable parts in the file.
# meson_options.txt	- All the options meson understands
#
# Variables for ports:
# MESON_ARGS		- Arguments passed to meson
#			format: -Denable_foo=true
# MESON_BUILD_DIR	- Path to the build directory
#			Default: ${WRKSRC}/_build
#

.if !defined(_INCLUDE_USES_MESON_MK)
_INCLUDE_USES_MESON_MK=	yes

# Sanity check
.if !empty(meson_ARGS)
IGNORE=	Incorrect 'USES+= meson:${meson_ARGS}'. meson takes no arguments
.endif

BUILD_DEPENDS+=		meson:devel/meson \
			python3.7:lang/python37 \
			python2.7:lang/python27 \
			py-setuptools>=0:devel/py-setuptools

# meson uses ninja
.include "${PORTSDIR}/Mk/extensions/ninja.mk"

# meson might have issues with non-unicode locales
USE_LOCALE?=	en_US.UTF-8

CONFIGURE_ARGS+=	--prefix ${PREFIX} \
			--mandir man

# meson has it own strip mechanic
INSTALL_TARGET=		install

# should we have strip separate from WITH_DEBUG?
.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--buildtype debug
.else
CONFIGURE_ARGS+=	--buildtype release \
			--strip
.endif

HAS_CONFIGURE=		yes
CONFIGURE_CMD=		meson
# Pull in manual set settings and from options
CONFIGURE_ARGS+=	${MESON_ARGS}

BUILD_WRKSRC=		${WRKSRC}/${MESON_BUILD_DIR}

INSTALL_WRKSRC=		${WRKSRC}/${MESON_BUILD_DIR}

TEST_WRKSRC=		${WRKSRC}/${MESON_BUILD_DIR}
TEST_TARGET=		test

MESON_BUILD_DIR?=	_build

CONFIGURE_LOG=		${MESON_BUILD_DIR}/meson-logs/meson-log.txt

# Add meson build dir at the end.
CONFIGURE_ARGS+=	${MESON_BUILD_DIR}

.endif #!defined(_INCLUDE_USES_MESON_MK)
