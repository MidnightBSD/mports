# Feature:	trigger
# Usage:	USES=trigger
# Valid ARGS:	none
#
# Variables:
# TRIGGERS: list of triggers to package
# this is here for freebsd compatibility for now.

.if !defined(_INCLUDE_USES_TRIGGER_MK)
_INCLUDE_USES_TRIGGER_MK=	yes

.if !empty(trigger_ARGS)
IGNORE=	Incorrect 'USES+= trigger:${trigger_ARGS}' trigger takes no arguments
.endif

TRIGGERS?=	${PORTNAME}
.for t in ${TRIGGERS}
SUB_FILES+=	${t}.ucl
PLIST_FILES+=	${LOCALBASE}/share/pkg/triggers/$t.ucl
.endfor

_USES_install+=	601:trigger-post-install
trigger-post-install:
	${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/share/pkg/triggers
.for t in ${TRIGGERS}
	${INSTALL_DATA} ${WRKDIR}/$t.ucl ${FAKE_DESTDIR}${LOCALBASE}/share/pkg/triggers/
.endfor
.endif
