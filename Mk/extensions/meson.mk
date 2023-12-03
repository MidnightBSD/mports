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

_valid_ARGS=            trueprefix

# Sanity check
.  for arg in ${meson_ARGS}
.    if empty(_valid_ARGS:M${arg})
IGNORE= Incorrect 'USES+= meson:${meson_ARGS}' usage: argument [${arg}] is not recognized
.    endif
.  endfor

BUILD_DEPENDS+=		python3.9:lang/python39 \
			meson:devel/meson

# meson uses ninja
.include "${PORTSDIR}/Mk/extensions/ninja.mk"

# meson might have issues with non-unicode locales
USE_LOCALE?=	en_US.UTF-8

. if ${meson_ARGS} == trueprefix
CONFIGURE_ARGS+=	--prefix ${TRUE_PREFIX} \
			--mandir man \
			--infodir ${INFO_PATH}
. else
CONFIGURE_ARGS+=	--prefix ${PREFIX} \
			--mandir man \
			--infodir ${INFO_PATH}
. endif

# Enable all optional features to make builds deterministic. Consumers can
# expose those as port OPTIONS_* or explicitly pass -D<option>=disabled
CONFIGURE_ARGS+=	--auto-features=enabled

# Disable color output.  Meson forces it on by default, Ninja
# strips it before it goes to the log, but Samurai does not, so we
# might end up with ANSI escape sequences in the logs.
CONFIGURE_ARGS+=	-Db_colorout=never

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
