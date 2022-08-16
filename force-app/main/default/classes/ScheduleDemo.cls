public with sharing class ScheduleDemo implements Schedulable {

    public void execute(SchedulableContext cont) {
        System.debug('Got here.');
    }

}