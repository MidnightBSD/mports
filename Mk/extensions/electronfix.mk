# Provide support for easy porting of Electron applications that are distributed
# in binary form.
#
# Feature:	electronfix
# Usage:	USES=electronfix:version
#
# An example usage might be:
#         USES=   electronfix:24
#
# Variables, which can be set by the port:
#
#  ELECTRONFIX_SYMLINK_FILES	List of files to be symlinked from Electron distribution.
#
#  ELECTRONFIX_MAIN_EXECUTABLE	File name of the main executable to be replaced
#				with the original Electron binary.

.if !defined(_INCLUDE_USES_ELECTRONFIX_MK)
_INCLUDE_USES_ELECTRONFIX_MK=	yes

_ELECTRONFIX_MK_VALID_VERSIONS=	28

# === parse version arguments ===
_ELECTRONFIX_MK_VERSION=	# empty
.  for _ver in ${_ELECTRONFIX_MK_VALID_VERSIONS}
.    if ${electronfix_ARGS:M${_ver}}
.      if !empty(_ELECTRONFIX_MK_VERSION)
BROKEN=		USES=electronfix:${electronfix_ARGS} contains multiple version definitions
.      else
_ELECTRONFIX_MK_VERSION=	${_ver}
.      endif
.    endif
.  endfor

.  include "${.CURDIR}/../../devel/electron${_ELECTRONFIX_MK_VERSION}/Makefile.version"

BUILD_DEPENDS+=	electron${_ELECTRONFIX_MK_VERSION}:devel/electron${_ELECTRONFIX_MK_VERSION}
RUN_DEPENDS+=	electron${_ELECTRONFIX_MK_VERSION}:devel/electron${_ELECTRONFIX_MK_VERSION}

ELECTRONFIX_SYMLINK_FILES?= \
			chromedriver \
			libEGL.so \
			libGLESv2.so \
			libffmpeg.so \
			libvk_swiftshader.so \
			libvulkan.so \
			resources.pak \
			snapshot_blob.bin \
			v8_context_snapshot.bin

_USES_install=		701:electronfix-post-install

.  if defined(DEVELOPER)
_USES_fakee=		995:electronfix-fake-qa
.  endif

electronfix-post-install:
	${RM} ${FAKE_DESTDIR}${DATADIR}/chrome-sandbox
	${RM} ${FAKE_DESTDIR}${DATADIR}/libvulkan.so.1
.  for f in ${ELECTRONFIX_SYMLINK_FILES}
	${RM} ${FAKE_DESTDIR}${DATADIR}/${f}
	${LN} -s ${LOCALBASE}/share/electron${_ELECTRONFIX_MK_VERSION}/${f} ${FAKE_DESTDIR}${DATADIR}/${f}
.  endfor
.  ifdef ELECTRONFIX_MAIN_EXECUTABLE
# We have to copy the electron binary instead of symlinking
	${CP} ${LOCALBASE}/share/electron${_ELECTRONFIX_MK_VERSION}/electron ${FAKE_DESTDIR}${DATADIR}/${ELECTRONFIX_MAIN_EXECUTABLE}
.  endif

electronfix-fake-qa:
	@${ECHO_CMD} "====> Checking for non-BSD ELF binaries"
	@${FIND} ${FAKE_DESTDIR}${DATADIR} -type f -exec brandelf {} ';' 2> /dev/null | grep -v "'FreeBSD' (9)"

.endif
